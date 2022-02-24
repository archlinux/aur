# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=jfrog-cli-bin
_pkgname=jfrog-cli
pkgver=2.13.0
pkgrel=1
pkgdesc="Simple interface to Artifactory, Bintray and Mission Control"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/jfrog/jfrog-cli"
license=('Apache')
depends=('glibc')
conflicts=('jfrog-cli' 'jfrog-cli-go')
provides=('jfrog-cli')

_artifact_name="$pkgname-$pkgver-$pkgrel.jfrog"
_source_base="$_artifact_name::https://releases.jfrog.io/artifactory/$_pkgname/v2/$pkgver"

source_x86_64=("$_source_base/$_pkgname-linux-amd64/jfrog")
source_i686=("$_source_base/$_pkgname-linux-386/jfrog")
source_armv7h=("$_source_base/$_pkgname-linux-arm/jfrog")
source_aarch64=("$_source_base/$_pkgname-linux-arm64/jfrog")

noextract=("$_artifact_name")

sha256sums_x86_64=('1aeb8ac39aeb3007de795cbf931e3cc278c96c138ccdd250bb1dad72b8e50c06')
sha256sums_i686=('ddf170e8f3c5b592907a432f58a1af1ebba88b2d582b0d1f7bd63b9caf6304a1')
sha256sums_armv7h=('8d330f8078dcc50f3f7f5feb7f3152ee8e301b798902c02379eefb2ff5e5b81a')
sha256sums_aarch64=('3b687625e3ab095fca76a00726fa9ca1c31260e673e57aa40a6ce57a43fdec14')

package() {
  install -Dm755 "$_artifact_name" "$pkgdir/usr/bin/jfrog"
}
