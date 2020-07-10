# Maintainer: Jérôme Deuchnord <jerome@deuchnord.fr>
# Contributor: Morris Jobke <hey AT morrisjobke DOT de>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

# Note: see the following URL to find the current version:
# https://blackfire.io/docs/up-and-running/installation?action=install&mode=full&location=local&os=manual&language=php&agent=feb50979-caae-4cf0-8021-3cf6a56f75dc

pkgname=blackfire-agent
pkgver=1.39.0
pkgrel=1
pkgdesc='Blackfire Profiler Agent - Fire up your PHP Apps Performance'
arch=('i686' 'x86_64')
url='https://blackfire.io'
license=('custom')
install='blackfire-agent.install'
depends=('glibc')

source=('blackfire-agent.service')
source_i686=("blackfire-agent-${pkgver}_i686::http://packages.blackfire.io/binaries/blackfire-agent/$pkgver/blackfire-agent-linux_386")
source_x86_64=("blackfire-agent-${pkgver}_x86_64::http://packages.blackfire.io/binaries/blackfire-agent/$pkgver/blackfire-agent-linux_amd64")

sha256sums=('aec343bca2f712d0dd22ccb43128d479e0280847e9573c2f37c183478f1ebcf6')
sha256sums_i686=('a6b3ed7e296b7e9ae5d1df852ae55ef929be17bfea658f43a18ec206e0a56ee4')
sha256sums_x86_64=('1a5de097ba27ea01acac7db8451f3ed466235cddc374c9ffda7bbaf8dd4bd039')

package(){
  install -dm 755 "$pkgdir"/etc/blackfire
  chown 487:487 "$pkgdir"/etc/blackfire
  install -dm 755 "$pkgdir"/var/log/blackfire

  install -Dm 755 blackfire-agent.service "$pkgdir"/usr/lib/systemd/system/blackfire-agent.service
  install -Dm 755 blackfire-agent-${pkgver}_$CARCH "$pkgdir"/usr/bin/blackfire-agent
}
