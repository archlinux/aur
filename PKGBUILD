# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=jfrog-cli-bin
_pkgname=jfrog-cli
pkgver=2.5.0
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

sha512sums_x86_64=('830b3f8b422063f603175fa75096a5264815d8d1b3b50cb4c95969291701861b4d4e9595d3ef717353c30c90ff1f1d1cade5f2e47f6cb0e50f99d1527b3f2a04')
sha512sums_i686=('a8babd5f8faa025722d13592cc6db1a6787de0083788692ecb2c14bb88f30644da32c287bce083281c7a095755187c06063cca2009a13a389ade0ce6992624e2')
sha512sums_armv7h=('c587cba3875966e304ca4171ddc0ce24d15c21df81010795b28f9d2c4d00f01c7138dc49c0fc9ee35bd35ae21df58c135a0a3fa9ef33bc6bbddf56dcaeb608c9')
sha512sums_aarch64=('9590da039889505b07f4079c3286ff97ceafb1636d55a35b5cfca6946f356975cb03cf7c44134a6342a438a2dca47781081f34c6d3bcf0c78a93d02c7644113a')

package() {
  install -Dm755 "$_artifact_name" "$pkgdir/usr/bin/jfrog"
}
