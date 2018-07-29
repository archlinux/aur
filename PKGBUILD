# Maintainer: Adam I <aci747@engineer.com>
pkgname=tldr-bash-git
pkgver=r93.f5c6abb
pkgrel=1
pkgdesc="Bash client for tldr: community driven man-by-example."
arch=('any')
url="https://gitlab.com/pepa65/tldr-bash-client"
source=("git+https://gitlab.com/pepa65/tldr-bash-client.git")
license=('GPL')
sha256sums=('SKIP')
depends=('bash' 'unzip' 'curl')
makedepends=('git')

pkgver() {
  cd tldr-bash-client
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd tldr-bash-client
  install -Dm755 tldr "$pkgdir/usr/bin/tldr"

} 
