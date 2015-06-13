# Maintainer: S.Leduc <sebastien@sleduc.fr>
pkgname=dothost-hg
_hgname=dothost
pkgrel=1
pkgver=3.385591fa3319
pkgdesc="dothost is a DNS lookup utility, which produces output in Graphviz format."
arch=("any")
url="http://jwilk.net/software/dothost"
license=('MIT')
depends=('python')
makedepends=('mercurial')
optdepends=('graphviz: Graph visualization software for lddot output'
            'perl-graph-easy: Convert or render graphs to ASCII/Image')
source=("${_hgname}::hg+https://bitbucket.org/jwilk/${_hgname}")
md5sums=("SKIP")

pkgver() {
  cd "$_hgname"
  echo "$(hg identify -n).$(hg identify -i)"
}

package() {
  cd "$_hgname"
  install -D -m 0755 $_hgname "$pkgdir/usr/bin/$_hgname"
}

# vim:set ts=2 sw=2 et:
