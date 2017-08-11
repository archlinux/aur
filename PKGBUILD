# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=terminus-terminal
_pkgname=terminus
_pkgver=1.0.0
pkgver=1.0.0.27
pkgrel=2
alpha=27
pkgdesc="A terminal for a more modern age"
arch=('x86_64')
url="https://github.com/Eugeny/terminus"
license=('MIT')
depends=('nodejs')
makedepends=('git' 'npm' 'yarn') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("terminus-terminal")
conflicts=("terminus-terminal")
replaces=('terminus-terminal')
source=("$url/releases/download/v${_pkgver}-alpha.$alpha/${_pkgname}_${_pkgver}-alpha.${alpha}_amd64.deb")
sha256sums=('8df8dcbe7d83a82cfb318768dfc943862f2d977edf5a20bb31120e45dc33dc6c')

package() {
  cd "$srcdir/"
  tar -xf data.tar.xz
  cp -r usr/ $pkgdir
  cp -r opt/ $pkgdir

 install -Dm755 /dev/stdin "$pkgdir"/usr/bin/$_pkgname <<END
  #!/usr/bin/bash
  /opt/Terminus/terminus

END

}
