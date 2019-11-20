# Copyright 2019 Lars Tennstedt
# 
# Redistribution and use in source and binary forms, with or without modification, are permitted 
# provided that the following conditions are met:
# 
# 1. Redistributions of source code must retain the above copyright notice, this list of conditions 
# and the following disclaimer.
# 
# 2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions 
# and the following disclaimer in the documentation and/or other materials provided with the 
# distribution.
# 
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR 
# IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND 
# FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR 
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL 
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, 
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER 
# IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF 
# THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

# Maintainer: Lars Tennstedt
pkgname=elm-bin
pkgver=0.19.1
pkgrel=1
pkgdesc="Elm compiler (official binary)"
arch=('x86_64')
url="https://elm-lang.org"
license=('BSD')
source=("https://github.com/elm/compiler/releases/download/${pkgver}/binary-for-linux-64-bit.gz"
        "https://raw.githubusercontent.com/elm/compiler/master/LICENSE")
noextract=('LICENSE')
sha256sums=('e44af52bb27f725a973478e589d990a6428e115fe1bb14f03833134d6c0f155c'
            '22bd883c0b78625bb39a21b96d38ddcb8469863b51718b8bda1ce46441f5bfce')

package() {
        mv binary-for-linux-64-bit elm 
	install -Dm755 -t "${pkgdir}/usr/bin" elm
        install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
