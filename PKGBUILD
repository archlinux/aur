# Maintainer: fenze <fenze@contact.dev>
pkgname=bitwarden-cli-bin
pkgver=$(curl "https://api.github.com/repos/bitwarden/clients/releases" | grep '"tag_name"' | cut -d : -f 2 | grep -Eo '".+"' | grep -Eo '[^"]+' | grep '^cli' | sed 's/cli-v//' | head -n 1)
pkgrel=1
pkgdesc='Bitwarden Command-line Interface'
arch=('x86_64')
url='https://github.com/bitwarden/clients'
license=('GPL3')
makedepends=('unzip')
conflicts=('bitwarden-cli')
options=('!strip')
source=("https://github.com/bitwarden/clients/releases/download/cli-v${pkgver}/bw-linux-${pkgver}.zip")
md5sums=('SKIP')

package() {
  install -Dm755 bw "${pkgdir}/usr/bin/bw"
}
