_npmname=nib
pkgname="nodejs-$_npmname" # All lowercase
pkgver=1.1.0
pkgrel=1
pkgdesc='Stylus mixins, utilities, components, and gradient image generation'
arch=(any)
url="https://github.com/visionmedia/$_npmname"
license=()
depends=('nodejs-stylus')
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=("$_npmname-$pkgver.tgz")
sha1sums=('527c19662a10a2b565fe85e9b309d622aa7557d3')

package() {
	local _npmdir="$pkgdir/usr/lib/node_modules/"
	mkdir -p "$_npmdir"
	cd "$_npmdir"
	npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}