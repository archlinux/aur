# Maintainer: Thomas Weißschuh <thomas_weissschuh@lavabit.com>
# Contributor: cga <cga@cga.cx>

pkgname=vim-nginx
epoch=2
pkgver=1.6.0
pkgrel=2
pkgdesc='Nginx syntax highlight for vim (now included in extra/nginx)'
arch=('any')
url='http://nginx.org'
license=('custom')
depends=('vim')
groups=('vim-plugins')
conflicts=('nginx')
source=("http://nginx.org/download/nginx-${pkgver}.tar.gz")

package() {
  cd "nginx-$pkgver"

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  for i in ftdetect indent syntax; do
    install -Dm644 contrib/vim/${i}/nginx.vim "${pkgdir}/usr/share/vim/vimfiles/${i}/nginx.vim"
  done
}

sha256sums=('943ad757a1c3e8b3df2d5c4ddacc508861922e36fa10ea6f8e3a348fc9abfc1a')
