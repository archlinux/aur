# Maintainer: Morris Jobke <hey AT morrisjobke DOT de>
# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=blackfire-agent
pkgver=1.11.2
pkgrel=1
pkgdesc='Blackfire Profiler - Fire up your PHP Apps Performance'
arch=('i686' 'x86_64')
url='https://blackfire.io'
license=('custom')
install='blackfire-agent.install'
depends=('glibc')

source=('blackfire-agent.service')
source_i686=("blackfire-agent-${pkgver}_i686::http://packages.blackfire.io/binaries/blackfire-agent/$pkgver/blackfire-agent-linux_386")
source_x86_64=("blackfire-agent-${pkgver}_x86_64::http://packages.blackfire.io/binaries/blackfire-agent/$pkgver/blackfire-agent-linux_amd64")

sha256sums=('aec343bca2f712d0dd22ccb43128d479e0280847e9573c2f37c183478f1ebcf6')
sha256sums_i686=('c7e5182a91c019ff19cba99adf8ee5507e98c8fa3d9c9d720f37781dbdd53f85')
sha256sums_x86_64=('9e44e5d16ee4a3a0f3fff0db09eced1f3189cf3fa83e3670aafbeed6f7fb24e8')

package(){
  install -dm 755 "$pkgdir"/etc/blackfire
  chown 487:487 "$pkgdir"/etc/blackfire
  install -dm 755 "$pkgdir"/var/log/blackfire

  install -Dm 755 blackfire-agent.service "$pkgdir"/usr/lib/systemd/system/blackfire-agent.service
  install -Dm 755 blackfire-agent-${pkgver}_$CARCH "$pkgdir"/usr/bin/blackfire-agent
}
