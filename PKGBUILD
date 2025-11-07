# Maintainer: FTS427 <FTS427@outlook.com>
# Python package author: Vincent <magicdroidx@gmail.com>
pkgname=python-sentry_crashpad
pkgver=0.7.17.1
pkgrel=2
pkgdesc="An open-source multiplatform crash reporting system written in C++ by Google"
arch=(any)
url="https://github.com/EndstoneMC/sentry-crashpad"
license=('Apache-2.0')
makedepends=('python' 'python-pip')
build() {
  pip install --no-deps --target="sentry_crashpad" sentry_crashpad==0.7.17.1
}
package() {
  sitepackages=$(python -c "import site; print(site.getsitepackages()[0])")
  mkdir -p "$pkgdir/$sitepackages"
  cp -r "$srcdir/sentry_crashpad/*" "$pkgdir/$sitepackages"
}
