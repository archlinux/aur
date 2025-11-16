# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Matthew Gamble <git@matthewgamble.net>
# Contributor: Nathan Owens <ndowens @ artixlinux.org>
# Contributor: carstene1ns <arch carsten-teibes de>

pkgname=python-tatsu
_name="tatsu"
pkgver=5.13.2
pkgrel=1
pkgdesc="TatSu takes a grammar in a variation of EBNF as input, and outputs a memoizing PEG/Packrat parser in Python"
arch=("any")
url="https://github.com/neogeny/TatSu"
license=("BSD")
depends=("python")
optdepends=("python-colorama" "python-rich")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('66c46670fc83d73d6a0fe7c310d857f035582783195dfc150afe858b4b3e67369cc1bdddcd47bed4b93835697d89a951124cd184df6f51b8780d4105d96f6748')

build(){
 cd "$_name-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_name-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
