# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=jfrog-cli-bin
_pkgname=jfrog-cli
pkgver=2.12.1
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

sha256sums_x86_64=('c2df78472a49afae0ec86785c8fca783c5b03c3a41024c443d259a4ce3b7f4aa')
sha256sums_i686=('ab58a3c92a1b77d21eaaa5045334afbda49efc4ddec5b2b6f252ea178105c1c4')
sha256sums_armv7h=('18fa28638a4f1a9f477ea0d37d9fdbb0cdc1dd883a25eaf401b746aa6f40e507')
sha256sums_aarch64=('b29e8768334bce8dd2607246b4d72aae214669f66561d6774c1d7f44e940ce2a')

package() {
  install -Dm755 "$_artifact_name" "$pkgdir/usr/bin/jfrog"
}
