# Maintainer: Brandon Mulcahy <brandon@jangler.info>
pkgname=modplay
pkgver=1.1.1
pkgrel=3
pkgdesc="A command-line IT/XM/S3M/MOD player"
arch=('any')
url="http://jangler.info/code/modplay"
license=('MIT')
depends=('dumb' 'portaudio')
source=("https://github.com/jangler/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('312f0e0145c4bc2382b466455cb036f29394f5a98b2809a9da9954b992f1d4c4')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 ${pkgname}.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
