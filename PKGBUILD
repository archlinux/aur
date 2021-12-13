# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=jfrog-cli-bin
_pkgname=jfrog-cli
pkgver=2.9.0
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

sha256sums_x86_64=('f1848333d1d09dbb07ff81ab2b9ac77a13df71a79b80046fb64aac51f10912f6')
sha256sums_i686=('cec7a3b1ce4ea4236d5fff32d77c41ba691b10c435e6d79d7e32c44e3e87ff78')
sha256sums_armv7h=('1f57b816221f3fcd5b585dd661fcdc9e76883a9fb03f273d58deb267ba00dc37')
sha256sums_aarch64=('a0ef4e2d084cf310a360d2c0ca9f34047ee1d2b10a9194116b37c89343bc91f4')

package() {
  install -Dm755 "$_artifact_name" "$pkgdir/usr/bin/jfrog"
}
