# Maintainer: paperbenni <paperbenni@gmail.com>

pkgname=git-annex-remote-ipfs-git
_pkgname=git-annex-remote-ipfs-git
pkgver=202110142127
pkgrel=1

pkgdesc="Git annex special remote to store content in ipfs"
url="https://github.com/paperbenni/git-remote-annex-ipfs"
arch=('any')
license=('GPL-v3')
options=(zipman)
depends=('go-ipfs' 'git' 'git-annex' 'jq')
makedepends=('git')
provides=('git-annex-remote-ipfs')
conflicts=('git-annex-remote-ipfs')

source=("$_pkgname::git+https://github.com/paperbenni/git-annex-remote-ipfs.git")
md5sums=("SKIP")

pkgver() {
  cd $_pkgname
  echo "$(date '+%Y%m%d%H%M')"
}

package() {
  cd $_pkgname
  make PREFIX=/usr/ DESTDIR="$pkgdir" install
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

