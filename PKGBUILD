# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=naabu-bin
pkgver=2.6.0
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
sha256sums_x86_64=('4cfb22e3d9f9d95bde8dc6e7e50fc571f53582e68759d4ae2ea3586a563e6876')
sha256sums_aarch64=('5c7fe08e1ab1a91089290f65e7c4b9087a46c18732a3eaa8c3db85031ffc20f1')

package() {
  install -Dv naabu -t "$pkgdir/usr/bin"
  install -Dvm644 "README-$pkgver" "$pkgdir/usr/share/doc/naabu/README.md"
  install -Dvm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/naabu/LICENSE"
}
