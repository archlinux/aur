# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

# powershell and powershell-editor-services build against the libraries of powershell-build-deps, which
# this package provides without them: they take the libraries that aren't installed from nuget.org, in
# the versions upstream references, so they don't have to be built from source. It ships nothing. The
# packages of .NET itself are chosen by dotnet-build-deps-10.0 instead.
pkgname=powershell-build-deps-bin
pkgver=1
pkgrel=1
pkgdesc="Lets PowerShell and its editor services build against the libraries from nuget.org instead of building them from source (meta package)"
arch=('any')
url='https://github.com/PowerShell/PowerShell'
license=('0BSD')
provides=("powershell-build-deps=$pkgver")
conflicts=(powershell-build-deps)
source=("LICENSE")
sha512sums=('a33658d9271e5c537ccd41bf540b463ad2a5eca4a060c80486ff42a736f0aa042d10436e7177c34d792177cb11285243dee1f31c4df54fb0bfaabbc306406930')
b2sums=('a29664104e1ee73ca0aee1d633e9095d92a57c92787f8d8740bdb7211ba3205782ed8677f539bdb8cae3dd75a3694be3132e185fa3fc4b3f401e1f88eb776101')

package() {
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
