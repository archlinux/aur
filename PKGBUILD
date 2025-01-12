# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Matthew Gamble <git@matthewgamble.net>
# Contributor: Nathan Owens <ndowens @ artixlinux.org>
# Contributor: carstene1ns <arch carsten-teibes de>

pkgname=python-tatsu
_name="tatsu"
pkgver=5.13.1
pkgrel=1
pkgdesc="TatSu takes a grammar in a variation of EBNF as input, and outputs a memoizing PEG/Packrat parser in Python"
arch=("any")
url="https://github.com/neogeny/TatSu"
license=("BSD")
depends=("python")
optdepends=("python-colorama" "python-rich")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('c5542b536abfb21a925b62296a1885334d41d6f79871883a5f19724644c8244f7fba783a4274685268cc4b3bd6ed943d35c301ad9a1a1ccbffc81ee8b51699b6')

build(){
 cd "$_name-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_name-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
