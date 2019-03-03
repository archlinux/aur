# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=terminus-terminal-bin
_pkgname=terminus
pkgver=1.0.71
pkgrel=1
pkgdesc="A terminal for a more modern age"
arch=('x86_64')
url="https://github.com/Eugeny/terminus"
license=('MIT')
depends=('nodejs')
#makedepends=('git' 'npm' 'yarn') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("terminus-terminal")
conflicts=("terminus-terminal")
replaces=('terminus-terminal')
source=("$url/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux.deb")
sha256sums=('a9e5c1254f954ddc865265196b25982450cfbe6607bb643353ad8c82a897ba7c')


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
