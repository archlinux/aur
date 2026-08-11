# Maintainer: Vivek Das Mohapatra <vivek@collabora.com>

pkgname=holo-plymouth-themes
_tag=v0.7
pkgver=${_tag#v}
pkgrel=1
arch=('any')
url='https://github.com/evlav/holo-plymouth-themes'
pkgdesc='Boot splash theme with optional progress bar, title, and messages'
license=('GPL-2.0-or-later') # same as plymouth, without which this is useless
makedepends=(git rsync)
source=("$pkgname::git+https://github.com/evlav/${pkgname}#tag=${_tag}")
b2sums=('9579aa50fadd4383bd2f4e3d1c016067fadb5db1f9a12d1bb8354bf52e75078a7fda5af854b23f62febd7cfba0ad486058d04c4f792886c66c36c2af9938676b')

build() {
    true
}

package () {
    rsync --exclude=assets -a "$srcdir"/$pkgname/* "$pkgdir"
}
