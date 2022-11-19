# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# https://aur.archlinux.org/packages/updaurpkg-git
# $ updaurpkg --apply
_repo=lukas-blecher/LaTeX-OCR
_pypi_package=pix2tex
_source_type=pypi-releases
_upstreamver='0.0.29'
_pkgname=pix2tex

pkgname=python-$_pkgname
pkgver=${_upstreamver##v}
pkgrel=1
pkgdesc="Using a ViT to convert images of equations into LaTeX code."
arch=(any)
url=https://github.com/$_repo
makedepends=(python-installer)
license=(MIT)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('55e41560a6d43d10c562b6b438f5e50d26af6f4958856fcf8d04ef44d1c864bc')

package() {
  cd "$srcdir" || return 1
  python -m installer --destdir="$pkgdir" ./*.whl
}
