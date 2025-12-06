# Maintainer: Filth <filth [at] wagn [dot] me>

_gemname="text-table"
pkgname="ruby-$_gemname"
pkgver=1.2.4
pkgrel=1
arch=("any")
pkgdesc="Allows you to easily create and format plain text tables, useful when working with the terminal or when you want to quickly print formatted tables to a dot-matrix printer."
url="https://rubygems.org/gems/$_gemname"
license=("MIT")
depends=('ruby')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
b2sums=('1aaf6f7a9bfd892fcd9211a120a59b84d4c46837d113deca9c79aca46ddfe87efdbc4b7b99c424a5e280a4c4dcb63d560b8d3d44fa288a8357ba60785d3e2651')
noextract=("$_gemname-$pkgver.gem")
options=(!emptydirs)

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
