# SPDX-License-Identifier: 0BSD
# Maintainer: jaytau <95355656+jay-tau@users.noreply.github.com>

pkgname=unreal-agent-bin
pkgver=0.1.1
pkgrel=1
pkgdesc='Async-first AI agent runner from Unreal Labs (prebuilt binary)'
arch=('x86_64')
url='https://github.com/unreallabsai/unreal-agent'
license=('MIT')
depends=('bash' 'ca-certificates')
provides=("unreal-agent=$pkgver")
conflicts=('unreal-agent')
options=('!strip')
source=("$url/releases/download/v$pkgver/unreal-agent-runner_${pkgver}_linux_amd64.tar.gz")
sha256sums=('fad9cb9e6e6272a8d16fb4b90f985abb3132572413588f96622c6b1a82e34fcd')

check() {
  ./unreal-agent-runner -h >/dev/null 2>&1
}

package() {
  install -Dm755 unreal-agent-runner "$pkgdir/usr/bin/unreal-agent-runner"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
