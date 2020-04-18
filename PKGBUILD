# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=vim-easy-align
pkgver=2.10.0
pkgrel=1
pkgdesc='Vim alignment plugin'
arch=('any')
LICENSE=('MIT')
url='https://github.com/junegunn/vim-easy-align'
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('c6a4e0a360aa8e642f5c628ae273bfbe7e513a394302eef8c668e16949bd2cbb')

package() {
  cd $pkgname-$pkgver

  for _dir in autoload plugin doc
  do
    install -dm755 "$pkgdir"/usr/share/vim/vimfiles/"$_dir"

    for _file in "$_dir"/easy_align.*
    do
      install -Dm644 "$_file" "$pkgdir"/usr/share/vim/vimfiles/"$_file"
    done
  done
}
