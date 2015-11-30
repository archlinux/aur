#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=pacserve
pkgver=2015.11
pkgrel=1
pkgdesc='Easily share Pacman packages between computers. A replacement for PkgD.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/pacserve"
depends=(python3-threaded_servers pyalpm)
backup=(etc/pacserve/pacserve.service.conf etc/pacserve/pacserve-ports.conf)
source=(
  http://xyne.archlinux.ca/projects/pacserve/src/pacserve-2015.11.tar.xz
  http://xyne.archlinux.ca/projects/pacserve/src/pacserve-2015.11.tar.xz.sig
)
sha512sums=(
  13072dc9e712dfa8314a7e1d352f841d4f3a652da2eb1d41aa9ea47fc1d2459dd7c577e31ed124a9c1819d31972d518db85208dd62941f9d290c75979c70848c
  de09b579c5b6d058c61492d9198567e128370b384da7e8b48ad836c20253abc5fd2c0a3253d8dbae68905cc6040629b8d01bbf801d897b03784d1f60fb8f198b
)
md5sums=(
  5bf2b4f3800358099fbd69b011679574
  642a912b4c8a8a41679cafc07955a38d
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
