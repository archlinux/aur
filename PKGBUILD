# Maintainer: chenjunyu19 <1335546814@qq.com>

pkgname=netease-cloud-music-dl-git
pkgver=r29.6d7920c
pkgrel=1
pkgdesc="Netease cloud music song downloader, with full ID3 metadata, eg: front cover image, artist name, album name, song title and so on."
arch=('any')
url="https://github.com/codezjx/netease-cloud-music-dl"
license=('MIT')
depends=('python' 'python-requests>=2.17.3' 'python-pycryptodomex' 'python-mutagen>=1.38.0' 'python-pillow>=4.3.0')
makedepends=('git' 'python-setuptools')
options=(!emptydirs)
source=("git+https://github.com/codezjx/netease-cloud-music-dl.git")
md5sums=('SKIP')
_gitname=netease-cloud-music-dl

pkgver() {
  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package(){
  cd "$srcdir/$_gitname"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
