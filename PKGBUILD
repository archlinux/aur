# Maintainer: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=pdf-redact-tools
pkgver=0.1
pkgrel=1
pkgdesc="Securely redact and strip metadata from docs before publishing"
arch=('any')
url="https://github.com/firstlook/pdf-redact-tools"
license=(GPLv3)
depends=('python2' 'imagemagick' 'perl-image-exiftool')
source=("https://github.com/firstlook/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('9d5f095e5d056eb527c08c4736b45c99aa6399424dd6ed7155e3d7cd1600c55e')

package() {
  cd $srcdir/${pkgname}-${pkgver}
  sed -i '1 s/python/python2/g' pdf-redact-tools
  install -Dm755 pdf-redact-tools "${pkgdir}/usr/bin/pdf-redact-tools"
}
# vim:set ts=2 sw=2 et:
