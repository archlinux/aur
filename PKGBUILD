# Maintainer: Morris Jobke <hey AT morrisjobke DOT de>
# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=blackfire-agent
pkgver=1.0.0
pkgrel=1
pkgdesc='Blackfire Profiler - Fire up your PHP Apps Performance'
arch=('i686' 'x86_64')
url='https://blackfire.io'
license='custom'
install='blackfire-agent.install'
depends=('glibc')

source=('blackfire-agent.service')
source_i686=("blackfire-agent-${pkgver}_i686::http://packages.blackfire.io/binaries/blackfire-agent/$pkgver/blackfire-agent-linux_386")
source_x86_64=("blackfire-agent-${pkgver}_x86_64::http://packages.blackfire.io/binaries/blackfire-agent/$pkgver/blackfire-agent-linux_amd64")

sha256sums=('aec343bca2f712d0dd22ccb43128d479e0280847e9573c2f37c183478f1ebcf6')
sha256sums_i686=('7d2ed163ef0703a6fdd784d37284e2d55674f4da9ebd33b702f22aec0297e229')
sha256sums_x86_64=('0c5fade43e68767d77f4bf3e19667fde2917c15589c92662c060fb1dc2a2b6a2')

package(){
  install -dm 755 "$pkgdir"/etc/blackfire
  chown 487:487 "$pkgdir"/etc/blackfire
  install -dm 755 "$pkgdir"/var/log/blackfire

  install -Dm 755 blackfire-agent.service "$pkgdir"/usr/lib/systemd/system/blackfire-agent.service
  install -Dm 755 blackfire-agent-${pkgver}_$CARCH "$pkgdir"/usr/bin/blackfire-agent
}
