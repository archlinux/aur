# Maintainer: Vianney le Clément de Saint-Marcq <code@quartic.eu>
pkgname=git-publish
pkgver=1.4.4
pkgrel=1
pkgdesc="Prepare and store patch revisions as git tags"
arch=('any')
url="https://github.com/stefanha/git-publish"
license=('MIT')
depends=('python' 'git')
makedepends=('perl')
source=("https://github.com/stefanha/git-publish/archive/v${pkgver}.tar.gz")
md5sums=('0b22af41f0405e02e67c3ddb3a5363a8')
sha1sums=('6699eec0b276e98b4dc809e532ca50a83ff2832c')
sha256sums=('46482fe1d17ba64895f0d5834633be2154476c4a1f023762bffe92a7c6a6b7ba')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  pod2man -c "Git Manual" git-publish.pod > git-publish.1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 git-publish "${pkgdir}/usr/bin/git-publish"

  install -Dm644 git-publish.1 "${pkgdir}/usr/share/man/man1/git-publish.1"
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r hooks "${pkgdir}/usr/share/doc/${pkgname}/hooks"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
