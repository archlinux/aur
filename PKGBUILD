# Maintainer: omarhanykasban <omarhanykasban706@gmail.com>

pkgname=steavensettings
pkgver=1.0.0
pkgrel=1
pkgdesc="SteavenGamerYT's Arch Linux Settings"
arch=('any')
url="https://github.com/steavenlinux/steavensettings"
license=('MIT')
depends=('git')
makedepends=('git')
source=(
  "steavensettings::git+https://github.com/steavenlinux/steavensettings.git"
  "archsettings::git+https://github.com/steavenlinux/archsettings.git"
)
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/steavensettings"
  git rev-parse --short HEAD
}

package() {
  # Install files from steavensettings
  cd "$srcdir/steavensettings"
  install -Dm755 usr/bin/amd-gpu-run "$pkgdir/usr/bin/amd-gpu-run"
  install -Dm755 usr/bin/intel-gpu-run "$pkgdir/usr/bin/intel-gpu-run"
  install -Dm755 usr/bin/nvidia-gpu-run "$pkgdir/usr/bin/nvidia-gpu-run"
  install -Dm755 usr/bin/nouveau-gpu-run "$pkgdir/usr/bin/nouveau-gpu-run"
  install -Dm755 usr/bin/killpicom "$pkgdir/usr/bin/killpicom"
  install -Dm755 usr/bin/game-run "$pkgdir/usr/bin/game-run"
  install -Dm644 etc/conf.d/libvirt-guests "$pkgdir/conf.d/libvirt-guests"
  install -Dm644 etc/environment.d/editor.conf "$pkgdir/usr/lib/environment.d/editor.conf"
  install -Dm644 etc/grub.d/40_cpu_mitigations.cfg "$pkgdir/etc/grub.d/40_cpu_mitigations.cfg"
  install -Dm644 etc/grub.d/40_distrust_cpu.cfg "$pkgdir/etc/grub.d/40_distrust_cpu.cfg"
  install -Dm644 etc/grub.d/40_enable_iommu.cfg "$pkgdir/ etc/grub.d/40_enable_iommu.cfg"
  install -Dm644 etc/modprobe.d/amdgpu.conf "$pkgdir/usr/lib/modprobe.d/amdgpu.conf"
  install -Dm644 etc/modprobe.d/blacklist.conf "$pkgdir/usr/lib/modprobe.d/blacklist.conf"
  install -Dm644 etc/modprobe.d/kvmfr.conf "$pkgdir/usr/lib/modprobe.d/kvmfr.conf"
  install -Dm644 etc/modprobe.d/nvidia.conf "$pkgdir/usr/lib/modprobe.d/nvidia.conf"
  install -Dm644 etc/modprobe.d/v4l2loopback.conf "$pkgdir/usr/lib/modprobe.d/v4l2loopback.conf"
  install -Dm644 etc/modules-load.d/kvmfr.conf "$pkgdir/usr/lib/modules-load.d/kvmfr.conf"
  install -Dm644 etc/modules-load.d/v4l2loopback.conf "$pkgdir/usr/lib/modules-load.d/v4l2loopback.conf"
  install -Dm644 etc/modules-load.d/zram.conf "$pkgdir/usr/lib/modules-load.d/zram.conf"
  install -Dm644 etc/NetworkManager/conf.d/default-wifi-powersave-on.conf "$pkgdir/usr/lib/NetworkManager/conf.d/default-wifi-powersave-on.conf"
  install -Dm644 etc/sysctl.d/80-gamecompatibility.conf "$pkgdir/usr/lib/sysctl.d/80-gamecompatibility.conf"
  install -Dm644 etc/systemd/coredump.conf.d/disable.conf "$pkgdir/usr/lib/systemd/coredump.conf.d/disable.conf"
  install -Dm644 etc/systemd/journald.conf.d/00-journal-size.conf "$pkgdir/usr/lib/systemd/journald.conf.d/00-journal-size.conf"
  install -Dm644 etc/systemd/system/battery_charge_threshold.service "$pkgdir/usr/lib/systemd/system/battery_charge_threshold.service"
  install -Dm644 etc/systemd/system/user@.service.d/99-reduce-time.conf "$pkgdir/usr/lib/systemd/user@.service.d/99-reduce-time.conf"
  install -Dm644 etc/systemd/system.conf.d/00-timeout.conf "$pkgdir/usr/lib/systemd/system.conf.d/00-timeout.conf"
  install -Dm644 etc/udev/rules.d/40-hpet-permissions.rules "$pkgdir/usr/lib/udev/rules.d/40-hpet-permissions.rules"
  install -Dm644 etc/udev/rules.d/50-sata.rules "$pkgdir/usr/lib/udev/rules.d/50-sata.rules"
  install -Dm644 etc/udev/rules.d/60-ioschedulers.rules "$pkgdir/usr/lib/udev/rules.d/60-ioschedulers.rules"
  install -Dm644 etc/udev/rules.d/60-sunshine.rules "$pkgdir/usr/lib/udev/rules.d/60-sunshine.rules"
  install -Dm644 etc/udev/rules.d/71-nvidia.rules "$pkgdir/usr/lib/udev/rules.d/71-nvidia.rules"
  install -Dm644 etc/udev/rules.d/90-arduino.rules "$pkgdir/usr/lib/udev/rules.d/90-arduino.rules"
  install -Dm644 etc/udev/rules.d/99-cpu-freq.rules "$pkgdir/usr/lib/udev/rules.d/99-cpu-freq.rules"
  install -Dm644 etc/udev/rules.d/99-intel-cpu-watts-fix.rules "$pkgdir/usr/lib/udev/rules.d/99-intel-cpu-watts-fix.rules"
  install -Dm644 etc/udev/rules.d/99-ntfs3_by_default.rules "$pkgdir/usr/lib/udev/rules.d/99-ntfs3_by_default.rules"
  install -Dm644 etc/udev/rules.d/99-ntsync.rules "$pkgdir/usr/lib/udev/rules.d/99-ntsync.rules"
  install -Dm644 etc/udisks2/mount_options.conf "$pkgdir/usr/lib/udisks2/mount_options.conf"
  install -Dm644 etc/chrony.conf "$pkgdir/etc/chrony.conf"
  install -Dm644 etc/polkit-1/rules.d/99-shutdown-reboot.rules "$pkgdir/etc/polkit-1/rules.d/99-shutdown-reboot.rules"

  # Install files from archsettings
  cd "$srcdir/archsettings"
  install -Dm644 etc/makepkg.conf.d/use-all-cores.conf "$pkgdir/etc/makepkg.conf.d/use-all-cores.conf"
  install -Dm644 etc/udev/rules.d/99-zram.rules "$pkgdir/usr/lib/udev/rules.d/99-zram.rules"

}
