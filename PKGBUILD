# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=naabu-bin
pkgver=2.6.1
pkgrel=1
pkgdesc='Fast port scanner with a focus on reliability and simplicity'
arch=('x86_64' 'aarch64')
url='https://github.com/projectdiscovery/naabu'
license=('MIT')
depends=('libpcap')
provides=('naabu')
conflicts=('naabu')
source=(
  "LICENSE-$pkgver::https://raw.githubusercontent.com/projectdiscovery/naabu/v$pkgver/LICENSE.md"
  "README-$pkgver::https://raw.githubusercontent.com/projectdiscovery/naabu/v$pkgver/README.md"
)
_bin="$url/releases/download/v$pkgver/naabu_${pkgver}_linux"
source_x86_64=("$pkgname-$pkgver-x86_64.zip::${_bin}_amd64.zip")
source_aarch64=("$pkgname-$pkgver-aarch64.zip::${_bin}_arm64.zip")
sha256sums=('cbcdaab87df3175107aa28915bd253cebdd618a49c9ac5d6c669c0b1cbebcacb'
            '81a9617bf294e1c75da03a08f22254ddf2e3340220e9202ce69aaff5b13eed12')
sha256sums_x86_64=('018c4c9884dea971eda860435ede3021d1150732f34cfd245498c6726d8cab90')
sha256sums_aarch64=('3adc2bb2395c3efff89623499b20eea66ef54924c485d3ae86762393a31736ea')

package() {
  install -Dv naabu -t "$pkgdir/usr/bin"
  install -Dvm644 "README-$pkgver" "$pkgdir/usr/share/doc/naabu/README.md"
  install -Dvm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/naabu/LICENSE"
}
