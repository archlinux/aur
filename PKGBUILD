# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=fioncat
_pkgname=csync
pkgname=${_pkgname}-bin
pkgver=0.8.3
pkgrel=1
pkgdesc="Share your clipboard between different devices"
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64')
license=('MIT')
depends=('glibc' 'gcc-libs' 'glib2' 'gtk3' 'gdk-pixbuf2' 'webkit2gtk-4.1' 'cairo' 'openssl' 'libsoup3')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
options=('!strip')
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${arch[0]}-unknown-linux-gnu.tar.gz")
sha256sums=('37eaee562feba2bd228c72458d686db925d33ff2f3f2527d9844eaee1196bd6a'
            'da2e1d5b34395a460e76cc984f195bc6ccc3a1eee98ae19bb340595130e0ab41')
sha256sums_x86_64=('26fbf3b757afa74d90da79f46d59a7dd09c1fca3a7d2d5eaab2e7986e9502362')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "csyncd" "${pkgdir}/usr/bin/csyncd"
  install -Dm755 "csynctl" "${pkgdir}/usr/bin/csynctl"
  install -Dm755 "csync-server" "${pkgdir}/usr/bin/csync-server"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
