# Maintainer: lucas <lucaszhou007@163.com>
pkgname=unsloth-studio-rocm-gfx90a-updater
pkgver=1.0.0
pkgrel=5
pkgdesc='nvchecker-based scheduled updater for Unsloth Studio on ROCm gfx90a (PyTorch stack + unsloth library)'
arch=('any')
url='https://aur.archlinux.org/packages/unsloth-studio-rocm-gfx90a-updater'
license=('MIT')
depends=('bash' 'curl' 'python' 'nvchecker')
install="$pkgname.install"
source=(
  "nvchecker.toml"
  "amd_pytorch.py"
  "unsloth-updater.sh"
  "unsloth-updater.service"
  "unsloth-updater.timer"
  "$pkgname.install"
  "README.md"
  "LICENSE"
)
sha256sums=('1c005a3f03ada52fa373d41365e53af35dc99b5b34c345ef56cf7e2950ffcfc8'
            '37ebd21256226a578b313fae943ac550be788331c6fe5501a8b922fc8f55841c'
            '2f4e7bff2e0643fa40175a07352df0fd897a5d871769d72965a26864793fc1a0'
            'cf1087ab9233f356578fd2b0945b8647e7d6ea6d77a4ae7cfb78341fd2af6974'
            '70b24bdc77a41712eeed101354f1639d85515eca187405852e535ab73c1601d2'
            '2dcb800fc043ad0a96d0e5f2c3b141546fdf9e1de928a2bdc58d8494cc7c2d88'
            'c992e55847b9c9afe1fa0ec4e2df4934e1b2bc6f3108e3811a232906d16fcbbf'
            '693e0b55505186e9ec38e236bed0841f65311846f39a74cc232daf0a6a724605')

package() {
  install -Dm755 amd_pytorch.py "$pkgdir/usr/lib/unsloth-updater/amd_pytorch.py"
  install -Dm755 unsloth-updater.sh "$pkgdir/usr/lib/unsloth-updater/unsloth-updater.sh"
  install -Dm644 nvchecker.toml "$pkgdir/usr/share/unsloth-updater/nvchecker.toml"
  install -Dm644 README.md "$pkgdir/usr/share/unsloth-updater/README.md"
  install -Dm644 unsloth-updater.service "$pkgdir/usr/lib/systemd/user/unsloth-updater.service"
  install -Dm644 unsloth-updater.timer "$pkgdir/usr/lib/systemd/user/unsloth-updater.timer"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
