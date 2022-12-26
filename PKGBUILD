# Maintainer: Evan Chen <evan@evanchen.cc>

pkgname=python-mdx_truly_sane_lists
_name=${pkgname#python-}
pkgver=1.3
pkgrel=1
pkgdesc='Extension for Python-Markdown that makes lists truly sane. Custom
indents for nested lists and fix for messy linebreaks.'
arch=(any)
url=https://github.com/radude/mdx_truly_sane_lists
license=(custom:MIT)
depends=(python python-markdown)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
  LICENSE)
sha256sums=('b661022df7520a1e113af7c355c62216b384c867e4f59fb8ee7ad511e6e77f45'
            '9ea8a12deea1b232d639881e35b0540f8678315ebcc27053a9d8359bd78ad040')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
