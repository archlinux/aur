# Maintainer: Morris Jobke <hey AT morrisjobke DOT de>
# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=blackfire-agent
pkgver=1.8.0
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
sha256sums_i686=('8d66fb05d53029586369fbc6f2e322b37947c38a5c570db8270618a61f9f012d')
sha256sums_x86_64=('cc5123119e85400e3e309b75f97e21318af8aad6890dbf03cacfe9abc32fcd86')

package(){
  install -dm 755 "$pkgdir"/etc/blackfire
  chown 487:487 "$pkgdir"/etc/blackfire
  install -dm 755 "$pkgdir"/var/log/blackfire

  install -Dm 755 blackfire-agent.service "$pkgdir"/usr/lib/systemd/system/blackfire-agent.service
  install -Dm 755 blackfire-agent-${pkgver}_$CARCH "$pkgdir"/usr/bin/blackfire-agent
}
