# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

# https://aur.archlinux.org/packages/updaurpkg-git
# $ updaurpkg --apply

_source_type=pypi-releases
_pypi_package=torchinfo
_upstreamver='1.7.1'
_pkgname=${_pypi_package}

pkgname=python-$_pkgname
pkgver=${_upstreamver}
pkgrel=1
pkgdesc="Model summary in PyTorch, based off of the original torchsummary"
arch=(x86_64)
url=https://github.com/$_repo
depends=(python-pytorch python-torchvision)
makedepends=(python-setuptools)
license=(MIT)
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver.tar.gz")
sha256sums=('7eb76ef0ca2d75aa7bf973451ba3693333ba97e197f8fa69d671b7f636384db4')

package() {
  cd "$srcdir/$_pkgname-$pkgver" || return 1
  python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
