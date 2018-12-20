# Maintainer: Daniel Moch <daniel AT danielmoch DOT com>

pkgname=vim-makejob
pkgver=1.3.1
pkgrel=1
pkgdesc="Minimal, asynchronous quickfix commands for Vim 8.0"
arch=('any')
url="https://git.danielmoch.com/vim-makejob"
license=('MIT')
depends=('vim')
source=("${url}/snapshot/${pkgname}-${pkgver}.tar.gz"{,.asc})
validpgpkeys=('72A97F7072DDCE28058DEF30323C9F1784BDDD43')
sha512sums=('2ef1785747725021b604be7bebd10798eb4af12e2a9900a10e377f7c2fe37b066f6c84d12d2fcbff7de85ee13caf4395c7b0a2efef9d0dcab3562392bc25804d'
            'SKIP')

package() {
  cd $pkgname-$pkgver

  local installpath="$pkgdir/usr/share/vim/vimfiles"
  install -Dm644 doc/makejob.txt "$installpath/doc/makejob.txt"
  install -Dm644 plugin/makejob.vim "$installpath/plugin/makejob.vim"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sts=2 sw=2 et ft=PKGBUILD
