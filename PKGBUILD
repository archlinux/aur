# Maintainer: Manish Khadka <manish.khadka@tutanota.com>

pkgname=agentcore-cli-bin
_pkgname=agentcore-cli
pkgver=1.0.3
pkgrel=1
pkgdesc='Create, develop and deploy agents to Amazon Bedrock AgentCore from the terminal'
arch=('x86_64' 'aarch64')
url='https://github.com/aws/agentcore-cli'
license=('Apache-2.0')
depends=('glibc')
provides=("$_pkgname" 'agentcore')
conflicts=("$_pkgname" 'agentcore')
# Self-contained JavaScript runtime with the app appended: stripping removes the app.
options=('!strip' '!debug')
source=("LICENSE-$pkgver::https://raw.githubusercontent.com/aws/agentcore-cli/v$pkgver/LICENSE")
source_x86_64=("agentcore-$pkgver-x86_64::$url/releases/download/v$pkgver/agentcore-linux-x64")
source_aarch64=("agentcore-$pkgver-aarch64::$url/releases/download/v$pkgver/agentcore-linux-arm64")
sha256sums=('09e8a9bcec8067104652c168685ab0931e7868f9c8284b66f5ae6edae5f1130b')
sha256sums_x86_64=('918fdcb7e2713064aae30b1097dfd18e045a3bd1a5eebc04f6b72802d55aee32')
sha256sums_aarch64=('3ec28d9a52d3d4df130213591aeb7c19ec989cae6652242a6e599676396656f4')

package() {
    install -Dm755 "agentcore-$pkgver-$CARCH" "$pkgdir/usr/bin/agentcore"
    install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
