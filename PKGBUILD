#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=pacserve
pkgver=2016
pkgrel=1
pkgdesc='Easily share Pacman packages between computers. A replacement for PkgD.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/pacserve"
depends=(pyalpm python3-threaded_servers)
backup=(etc/pacserve/pacserve-ports.conf etc/pacserve/pacserve.service.conf)
source=(
  http://xyne.archlinux.ca/projects/pacserve/src/pacserve-2016.tar.xz
  http://xyne.archlinux.ca/projects/pacserve/src/pacserve-2016.tar.xz.sig
)
sha512sums=(
  780693734ef09fd79699f9f982a864a414e100e2a20d86477c2206225835605334b563721ada347dca3eed11d86eadf6c48c23294d6cb95f992b9be131319258
  b9673ee164522f65f2da7aad2e87fed7b4d2b1bb9852d639f79a5c34c896899319d380f0233fa1d70df55150994d4ed11c83f94a009c002fb46b3af17ebc2645
)
md5sums=(
  210fd1f1008a8f0cc2c501ef0ba9f9f0
  448d071a157c7f75670afeafb6d88da4
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"


  for foo_ in etc/*/*
  do
    install -Dm644 "$foo_" "$pkgdir/$foo_"
  done

  for bin_ in bin/*
  do
    install -Dm755 "$bin_" "$pkgdir/usr/bin/${bin_##*/}"
  done

  for service_ in systemd/*.service
  do
    install -Dm644 "$service_" "$pkgdir/usr/lib/systemd/system/${service_##*/}"
  done
}

# vim: set ts=2 sw=2 et:
