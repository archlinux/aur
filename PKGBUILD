# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Matthew Gamble <git@matthewgamble.net>
# Contributor: Nathan Owens <ndowens @ artixlinux.org>
# Contributor: carstene1ns <arch carsten-teibes de>

pkgname=python-tatsu
_name="tatsu"
pkgver=5.24.0
pkgrel=1
pkgdesc="TatSu takes a grammar in a variation of EBNF as input, and outputs a memoizing PEG/Packrat parser in Python"
arch=("any")
url="https://github.com/neogeny/TatSu"
license=("BSD")
depends=("python")
optdepends=("python-colorama" "python-rich")
makedepends=("python-build" "python-installer" "python-wheel" "python-hatchling")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('a85daa2b770b237d4ca6ae94bab54324dc5b24c691c49da5b38e9651d23a0316ca7d5080f3c51d4ac00bc9d60c69542600ae8ffc85eb0648fe6590964829daeb')

build(){
 cd "$_name-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_name-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
