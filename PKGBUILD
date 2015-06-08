# Maintainer: Morris Jobke <hey AT morrisjobke DOT de>
pkgname=blackfire-agent
pkgver=0.25.3
pkgrel=1
pkgdesc='Blackfire Profiler - Fire up your PHP Apps Performance'
arch=('i686' 'x86_64')
url='https://blackfire.io'
license='custom'
install='blackfire-agent.install'
source=('blackfire-agent.service' 'blackfire-agent.install')
source_i686=("http://packages.blackfire.io/binaries/blackfire-agent/$pkgver/blackfire-agent-linux_386")
source_x86_64=("http://packages.blackfire.io/binaries/blackfire-agent/$pkgver/blackfire-agent-linux_amd64")
md5sums=('048b509f1d16fb5c7321d6645a4dcf24'
         '36fd826f62db627c45b8c99061ec179f')
md5sums_i686=('611a35e6fa7c374eaa6458c37eb0548e')
md5sums_x86_64=('ecb085c6ffc37227d775466811d37aa9')

package(){
  install -dm 755 ${pkgdir}/etc/blackfire
  chown 487:487 ${pkgdir}/etc/blackfire
  install -dm 755 ${pkgdir}/var/log/blackfire

  install -Dm 755 blackfire-agent.service ${pkgdir}/usr/lib/systemd/system/blackfire-agent.service
  install -Dm 755 blackfire-agent-linux_* ${pkgdir}/usr/bin/blackfire-agent
}
