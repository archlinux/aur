# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=jfrog-cli-bin
_pkgname=jfrog-cli
pkgver=2.11.1
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

sha256sums_x86_64=('2f8ab8a4954fd9c55bcafa85cedbd1c6a4dd6e1557ae3dfc7d9440ec7412fae6')
sha256sums_i686=('d543a5c59dd6c79fc8803126e4942cbe7b9a0569e49e0698c3d1bd65c2e5c9f7')
sha256sums_armv7h=('347a690f36df2fdee91719f6fe395cace3a02b0140a2cc10b7002e313debdf0f')
sha256sums_aarch64=('7159329179414f6b386f49507c3a27a2a0d0aa670af99523cf3294cf3800dd3c')

package() {
  install -Dm755 "$_artifact_name" "$pkgdir/usr/bin/jfrog"
}
