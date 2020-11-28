# Maintainer: tmikey

_srcname=pid_fan_controller
pkgname=pid-fan-controller
pkgver=1.1
pkgrel=1
pkgdesc="PID fan controller with Python3"
arch=('any')
url="https://github.com/ThunderMikey/pid_fan_controller"
license=('GPL3')
depends=('python3' 'python-simple-pid' 'python-pyaml')
provides=("$pkgname")
source=(https://github.com/ThunderMikey/pid_fan_controller/archive/$pkgver.tar.gz)
md5sums=('70887cd6c32c380d5061dc8e92d57fa0')
backup=('etc/pid_fan_controller_config.yaml')

package() {
  cd "$_srcname-$pkgver"
  install -m 644 -Dt "$pkgdir/usr/lib/systemd/system/" pid-fan-controller.service \
    pid-fan-controller-sleep-hook.service
  install -m 644 -Dt "$pkgdir/etc/" pid_fan_controller_config.yaml
  install -m 755 -Dt "$pkgdir/usr/share/$pkgname/" pid_fan_controller.py override_auto_fan_control.py
}

# vim:set ts=2 sw=2 et:
