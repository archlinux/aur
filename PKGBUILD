# Maintainer: Sergio Tridente <tioduke (at) gmail (dot) com>

_pkgname=feed2toot
pkgname=python-feed2toot-git
pkgver=0.7.r0.g5af950e
pkgrel=1
pkgdesc="Feed2toot automatically parses rss feeds, identifies new posts and posts them on the Mastodon social network."
arch=('any')
url="https://gitlab.com/chaica/feed2toot"
license=('GPL3')
depends=('python-feedparser' 'python-mastodon')
makedepends=('python-setuptools')
source=("git+https://gitlab.com/chaica/feed2toot.git")
md5sums=('SKIP')
_gitname=$_pkgname


pkgver() {
	cd "$srcdir/$_gitname"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/$_gitname"
	python setup.py install --root="$pkgdir/" --optimize=1
}
