# Maintainer: Ian Ker-Seymer <i.kerseymer@gmail.com>

pkgname=climate
pkgver=0.3
pkgrel=1
pkgdesc="Climate is the ultimate command line tool for Linux"
url="https://github.com/adtac/climate"
arch=('any')
license=('GPLv3')
optdepends=('unzip: extracting zip files'
            'wget: retrieving files'
            'curl: making http requests'
            'dnsutils: provides dig command'
            'git: git support'
            'rar: extacting rar files'
            'python: running python scripts'
            'pip: installing python packages'
            'node: running node scripts'
            'fdupes: de-deplicating files'
            'sshfs: ssh filesystem support'
            'lm_sensors: read cpu temperatures, voltage, fans'
            'speedtest-cli: check networking speed'
            'gawk: gawk suport'
            'p7zip: extracting 7z files')
install="${pkgname}.install"
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('3724f10e1cf5d900f0e2611e7377e212311031d810d93a6784ac8e2de7c1f866')

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
