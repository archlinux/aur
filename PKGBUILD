#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=pacserve
pkgver=2015
pkgrel=2
pkgdesc='Easily share Pacman packages between computers. A replacement for PkgD.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/pacserve"
depends=(python3-threaded_servers pyalpm)
backup=(etc/pacserve/pacserve.service.conf etc/pacserve/pacserve-ports.conf)
source=(
  http://xyne.archlinux.ca/projects/pacserve/src/pacserve-2015.tar.xz
  http://xyne.archlinux.ca/projects/pacserve/src/pacserve-2015.tar.xz.sig
)
sha512sums=(
  1c3349382a9fb6c563ab145ea559de304623f02f8db0350a69e989cbc569bcd0d56bf18b6d5a2a6edcb571bc0c042c14680769320de8c2d6c8983244f065b741
  6277f3f7a9c0e58381e6fc1dad8e4ac6b93aa51da6b15a553e73812bdf988f5cd87113ea9a3abb20c23fea0db52e427cea2ab576f84ee707b36e6e8fba775055
)
md5sums=(
  2d4e1346543035b4d87d33444baf4ac3
  a0eeac546ee8a04f6be691ad5c38be61
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
