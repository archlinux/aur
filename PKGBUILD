# Maintainer: fenze <fenze@contact.dev>
pkgname=bitwarden-cli-bin
pkgver=$(curl --silent "https://api.github.com/repos/bitwarden/cli/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")' | cut -c 2-)
pkgrel=1
pkgdesc='Bitwarden Command-line Interface'
arch=('x86_64')
url='https://github.com/bitwarden/cli'
license=('GPL3')
makedepends=('unzip')
conflicts=('bitwarden-cli')
options=('strip')
source=("https://github.com/bitwarden/cli/releases/download/v$pkgver/bw-linux-$pkgver.zip")
md5sums=('SKIP')

package() {
  unzip bw-linux-*.zip
  install -Dm755 bw "${pkgdir}/usr/bin/bw"
}
