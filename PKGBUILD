# Maintainer: Duc A. Hoang <anhduc.hoang1990@gmail.com>

_pkgname=ipe2tikz
pkgname=$_pkgname-git
pkgrel=1
pkgver=a68751a
arch=('i686' 'x86_64')
makedepends=('git')
depends=('ipe')
url="https://github.com/QBobWatson/ipe2tikz"
pkgdesc="ipe2tikz - export Ipe figure to TikZ picture"
source=("git+https://github.com/QBobWatson/ipe2tikz.git")
md5sums=('SKIP')
_ipever=$(pacman -Qi ipe | grep -Po '(?<=^Version).*' | sed "s/^\s*: //" | sed "s/[-][0-9]//")

package() { 
  mkdir -p "$pkgdir/usr/share/ipe/$_ipever/styles"
  mkdir -p "$pkgdir/usr/lib/ipe/$_ipever/ipelets"
  mkdir -p "$pkgdir/usr/share/texmf-dist/tex/latex/ipe2tikz"

  cp "$srcdir/ipe2tikz/tikz.isy" "$pkgdir/usr/share/ipe/$_ipever/styles"
  cp "$srcdir/ipe2tikz/tikz.lua" "$pkgdir/usr/lib/ipe/$_ipever/ipelets"
  cp "$srcdir/ipe2tikz/tikzlibraryipe.code.tex" "$pkgdir/usr/share/texmf-dist/tex/latex/ipe2tikz"
}

# vim: ft=sh syn=sh et ts=2 sw=2
