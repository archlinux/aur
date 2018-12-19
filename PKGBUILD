# Maintainer: Daniel Moch <daniel AT danielmoch DOT com>

pkgname=vim-makejob
pkgver=1.3.0
pkgrel=2
pkgdesc="Minimal, asynchronous quickfix commands for Vim 8.0"
arch=('any')
url="https://git.danielmoch.com/vim-makejob"
license=('MIT')
depends=('vim')
source=("${url}/snapshot/${pkgname}-${pkgver}.tar.gz"{,.asc})
validpgpkeys=('72A97F7072DDCE28058DEF30323C9F1784BDDD43')
sha512sums=('67c0cffa905d652f696ae89c6906ca38b7f34af28a1b7e47c5cdf22a06f8a694f7bb1fae1ec2928e4dd813ac224071f9369563031688da31cda6fd903ab09440'
            'SKIP')

package() {
  cd $pkgname-$pkgver

  local installpath="$pkgdir/usr/share/vim/vimfiles"
  install -Dm644 doc/makejob.txt "$installpath/doc/makejob.txt"
  install -Dm644 plugin/makejob.vim "$installpath/plugin/makejob.vim"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sts=2 sw=2 et ft=PKGBUILD
