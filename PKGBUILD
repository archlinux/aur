# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

# powershell and powershell-editor-services build against the libraries of powershell-build-deps and
# powershell-editor-services-build-deps, which these packages provide without them: they take the
# libraries that aren't installed from nuget.org, in the versions upstream references, so they don't
# have to be built from source. They ship nothing, and so are split packages of one PKGBUILD, unlike the
# ones they replace. The packages of .NET itself are chosen by dotnet-build-deps-10.0 instead.
pkgbase=powershell-build-deps-bin
pkgname=(powershell-build-deps-bin powershell-editor-services-build-deps-bin)
pkgver=1
pkgrel=1
arch=(any)
url='https://github.com/PowerShell/PowerShell'
license=(0BSD)
source=("LICENSE")
sha512sums=('a33658d9271e5c537ccd41bf540b463ad2a5eca4a060c80486ff42a736f0aa042d10436e7177c34d792177cb11285243dee1f31c4df54fb0bfaabbc306406930')
b2sums=('a29664104e1ee73ca0aee1d633e9095d92a57c92787f8d8740bdb7211ba3205782ed8677f539bdb8cae3dd75a3694be3132e185fa3fc4b3f401e1f88eb776101')

package_powershell-build-deps-bin() {
  pkgdesc="Lets PowerShell build against the libraries from nuget.org instead of building them from source (meta package)"
  provides=("powershell-build-deps=$pkgver")
  conflicts=(powershell-build-deps)
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${FUNCNAME[0]#package_}/"
}

package_powershell-editor-services-build-deps-bin() {
  pkgdesc="Lets the PowerShell editor services build against the libraries from nuget.org instead of building them from source (meta package)"
  provides=("powershell-editor-services-build-deps=$pkgver")
  conflicts=(powershell-editor-services-build-deps)
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${FUNCNAME[0]#package_}/"
}
