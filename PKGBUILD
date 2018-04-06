# Maintainer: chenjunyu19 <chenjunyu19@qq.com>

pkgname=netease-dl-git
pkgver=r37.84b226f
pkgrel=1
pkgdesc=基于命令行的网易云音乐下载器
arch=('any')
url="https://github.com/ziwenxie/netease-dl"
license=('MIT')
depends=('python' 'python-requests>=2.10.0' 'python-pycryptodomex' 'python-click>=5.1' 'python-prettytable>=0.7.2')
makedepends=('git' 'python-setuptools')
options=(!emptydirs)
source=("git+https://github.com/ziwenxie/netease-dl")
md5sums=('SKIP')
_gitname=netease-dl

pkgver() {
  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package(){
  cd "$srcdir/$_gitname"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}