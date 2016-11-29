# Maintainer: Ian Ker-Seymer <i.kerseymer@gmail.com>

pkgname=climate
pkgver=0.2
pkgrel=1
pkgdesc="Climate is the ultimate command line tool for Linux"
url="https://github.com/adtac/climate"
arch=('any')
license=('GPLv3')
optdepends=('unzip: extracting zip files'
            'wget: retrieving files'
            'curl: making http requests'
            'dig: dns support'
            'git: git support'
            'rar: extacting rar files'
            'python: running python scripts'
            'pip: installing python packages'
            'node: running node scripts'
            'fdupes: de-deplicating files'
            'sshfs: ssh filesystem support'
            '7z: extracting 7z files')
install="${pkgname}.install"
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('781f42f4d59374e90f9c3efba271209d8b5e985279696bdd93bcd2f826f0177e')

build() {
  cd "${pkgname}-${pkgver}"
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm644 climate "${pkgdir}/usr/bin/climate"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  chmod +x "$pkgdir/usr/bin/climate"
}

# vim:set ts=2 sw=2 et:
