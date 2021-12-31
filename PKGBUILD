# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=jfrog-cli-bin
_pkgname=jfrog-cli
pkgver=2.10.0
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

sha256sums_x86_64=('802c0a07499bfcce0179b3481a4d9598e8ce5920134c75658381c504a51de7d3')
sha256sums_i686=('a5ffc0bbf8ec9f24ce2c50ae90a799e349c54b1471f7ec08d7fff376423e7443')
sha256sums_armv7h=('c070bfedfd7c5bdd1fea8e7f15eba8d7cbc4c3b7297c8418d5ca3a32ec35b539')
sha256sums_aarch64=('c5aaa186e070f5ac6bd910d4afbb90f56a852ba373b72633d2a32415655edcc6')

package() {
  install -Dm755 "$_artifact_name" "$pkgdir/usr/bin/jfrog"
}
