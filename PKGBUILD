# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=jfrog-cli-bin
_pkgname=jfrog-cli
pkgver=2.4.0
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

sha512sums_x86_64=('22f5d55ec32f5cddc332245e4e1c6773dd3c3ac54d0e32827213a79d1f98d3ae005d53d881aefb3b919d4c55b7cb1d1fec045750f9169d060155465c0a2b58c6')
sha512sums_i868=('57aad9346992d6a4d2025660a2c8bebb249c892c933c4ac82095de47e101a124b6ab93c563a5ed61aaaf3d43f260b164142a15cd1ee9013b1d01fc01f716175c')
sha512sums_armv7h=('21ef630339513af1b67407c841c002f07877584a081fb75bd4ae503c0ffc6a1ddf40c09a3dd8f11e7622a82b994d83775e2360e90db61d26264d028a62345c80')
sha512sums_aarch64=('77adcd83646c0425daae0c34d26983be0fe38ff098b20424d8e5f5721aa73dc74453a094dc60be4d5a4e6d3cd0bfde79d0ccf4afcc22f559b24838dae23cbcec')

package() {
  install -Dm755 "$_artifact_name" "$pkgdir/usr/bin/jfrog"
}
