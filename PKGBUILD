# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzy01@qq.com>
# https://aur.archlinux.org/packages/updaurpkg-git
# $ updaurpkg .
_repo=heavenshell/py-doq
_source_type=github-releases
_upstreamver='0.9.1'
_pkgname=${_repo##*/py-}

pkgname=python-${_pkgname}
pkgver=${_upstreamver##v}
pkgrel=4
pkgdesc='Docstring generator'
arch=(any)
url=https://github.com/$_repo
license=(BSD)
depends=(python-parso python-jinja python-toml)
makedepends=(python-setuptools)
source=("$_pkgname-$pkgver::https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('baccc348ddf967c8bf32bfdf54da8326e1dc74f37865e2c176012ad0bc7eea1e')

package() {
	cd "$_pkgname-$pkgver" || exit 1

	python setup.py install --root="$pkgdir" --optimize=1
}
